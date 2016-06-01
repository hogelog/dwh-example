# dwh-example
DWH batch application example powered by [Bricolage](https://github.com/aamine/bricolage)

## Setup

- Setup [embulk](http://www.embulk.org/docs/)
- Install gems
```
$ bundle install
...
$ embulk bundle install --gemfile embulk/Gemfile
...
```
- Setup [Amazon Redshift](https://aws.amazon.com/jp/redshift/) instance
  - ...
- Setup MySQL
  - ...
- Setup [Amazon S3](https://aws.amazon.com/jp/s3/) bucket
- Setup .env
```
$ cp .env.sample .env
$ vim .env
...
```
- Setup test data
  - Upload [example csv logs](https://github.com/hogelog/dwh-example/blob/master/example_data/s3/logs/) to s3 bucket
  - Import [example mysql tables](https://github.com/hogelog/dwh-example/tree/master/example_data/mysql) 
- Run jobnet
```
$ bundle exec bricolage-jobnet main/daily.jobnet
...
2016-06-02 11:52:04 +0900: INFO: status: 0 (pid 6347 exit 0)
2016-06-02 11:52:04 +0900: INFO: 0.84 secs
2016-06-02 11:52:04 +0900: INFO: SUCCESS
2016-06-02 11:52:04 +0900: INFO: jobnet total: 26.40 secs
2016-06-02 11:52:04 +0900: INFO: status all green
```
- View results
```
$ psql ... # connect your redshift database
psql (9.5.1, server 8.0.2)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: on)
Type "help" for help.

development=# \d
             List of relations
 schema |      name       | type  |  owner  
--------+-----------------+-------+---------
 public | review_counts   | table | dwh
 public | reviews         | table | dwh
 public | reviews_old     | table | dwh
 public | search_logs     | table | dwh
 public | tmp_search_logs | table | dwh
(5 rows)

development=# select * from search_logs ;
    request_time     | user_id | keyword 
---------------------+---------+---------
 2016-06-01 21:57:34 |       2 | テラス
 2016-06-01 23:57:34 |    4512 | 晴天
 2016-06-01 19:57:34 |     122 | 高原
(3 rows)

development=# select * from review_counts ;
 user_id | counts 
---------+--------
     121 |      1
    3321 |      1
       3 |      1
(3 rows)

development=# 
```

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `place_id` int(10) unsigned NOT NULL,
  `point` float unsigned NOT NULL,
  `comment` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `reviews` VALUES (1,121,1002,4.2,'楽しかった！','2016-06-02 09:52:53','2016-06-02 09:52:53'),(2,3321,2,4.6,'すごい！','2016-06-02 09:53:22','2016-06-02 09:53:22'),(3,3,122,4,'いい日だったな〜','2016-06-02 09:53:55','2016-06-02 09:53:55');

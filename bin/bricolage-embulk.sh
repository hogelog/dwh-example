#!/bin/bash

# Clear bundler environment.
unset BUNDLE_BIN_PATH BUNDLE_GEMFILE GEM_HOME GEM_PATH RUBYLIB RUBYOPT

exec embulk "$@"

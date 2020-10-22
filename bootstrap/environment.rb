# Rails app directory (where you store web interface dir)
RAILS_ROOT = '/app/web'

# This is where scripts dir is.
GRADER_ROOT = "/app/judge/scripts"

# This load all required codes
require File.join(File.dirname(__FILE__),'../lib/boot')

# load the required environment file
require File.dirname(__FILE__) + "/env_#{GRADER_ENV}.rb"

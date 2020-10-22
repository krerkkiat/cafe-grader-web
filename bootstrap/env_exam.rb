#
# See documentation in lib/configuration.rb
#
Grader::Initializer.run do |config|

    config.problems_dir = GRADER_ROOT + "/../ev-exam"
    config.user_result_dir = GRADER_ROOT + "/../result"
    
    config.talkative = true
    config.logging = true
    config.log_dir = GRADER_ROOT + "/../log"
    
    config.report_grader = true
   
    config.test_request_input_base_dir = RAILS_ROOT + "/data/test_request/input"
    config.test_request_output_base_dir = RAILS_ROOT + "/data/test_request/output"
    config.test_request_problem_templates_dir = config.problems_dir + "/test_request"
   
    config.comment_report_style = :short
  end
  
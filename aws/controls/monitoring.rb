# encoding: utf-8
# copyright: 2018, The Authors

title 'Dynamic test - AWS Services; Monitoring tools'

# Attributes here.
content = inspec.profile.file("monitoring-config.JSON")
params = JSON.parse(content)
# body_content = attribute('body.content', description: 'Expected content in the body of the target')



# Controls here.

#! /usr/bin/env ruby
#
# check-kafka-ping
#
# DESCRIPTION:
#  check-kafka-ping get Kafka overall status
#
# OUTPUT:
#   UP/DOWN
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: rest-clien
#
# USAGE:
#
# NOTES:
#  Depends on https://github.com/arnobroekhof/kafka-http-metrics-reporter
#
# LICENSE:
#   Zubov Yuri <yury.zubau@gmail.com> sponsored by Actility, https://www.actility.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'rest-client'
require 'json'
require 'sensu-plugins-kafka'

class CheckKafkaPing < Sensu::Plugin::Check::CLI
  include CommonKafka

  option :endpoint,
         short: '-p ENDPOINT',
         long: '--endpoint ENDPOINT',
         description: 'kafka.http.metrics Endpoint',
         default: 'http://localhost:8897/api/ping'

  def run
    result = request
    if result.to_s.strip == 'pong'
      ok 'Kafka is UP'
    elsif result == 'DOWN'
      warning 'Kafka is DOWN'
    end
  rescue StandardError => e
    critical e.message
  end
end

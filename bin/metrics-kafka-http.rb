#! /usr/bin/env ruby
#
# metrics-kafka-http
#
# DESCRIPTION:
#  metrics-kafka-http get metrics from Kafka
#
# OUTPUT:
#   metric-data
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: rest-clien
#
# USAGE:
#
#
# NOTES:
#  Depends on https://github.com/arnobroekhof/kafka-http-metrics-reporter
#
# LICENSE:
#   Zubov Yuri <yury.zubau@gmail.com> sponsored by Actility, https://www.actility.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require 'rest-client'
require 'json'
require 'sensu-plugins-kafka2'

class MetricsKafkaHttp < Sensu::Plugin::Metric::CLI::Generic
  include CommonKafka2
  option :endpoint,
         short: '-p ENDPOINT',
         long: '--endpoint ENDPOINT',
         description: 'kafka.http.metrics Endpoint',
         default: 'http://localhost:8897/api/metrics'

  option :scheme,
         description: 'Metric naming scheme, text to prepend to metric',
         short: '-S SCHEME',
         long: '--scheme SCHEME',
         default: "#{Socket.gethostname}.kafka"

  def metrics
    response = request
    ::JSON.parse(response)
  end

  def run
    print_hash(metrics)
    ok
  end
end

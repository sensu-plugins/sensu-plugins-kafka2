# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format located [here](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]

### Breaking Changes
- renamed to `sensu-plugins-kafka2` to avoid namespace conflict per [this](https://github.com/obazoud/sensu-plugins-kafka/issues/21) issue (@majormoses)

### Added
- check-kafka-ping.rb(@yuri-zubov sponsored by Actility, https://www.actility.com)
- check-topic.rb(@yuri-zubov sponsored by Actility, https://www.actility.com)
- check-topics-name.rb(@yuri-zubov sponsored by Actility, https://www.actility.com)
- metrics-kafka-http.rb(@yuri-zubov sponsored by Actility, https://www.actility.com)

- Basic Skel to be used to make new plugin repo setup easier.
- PR template
- Rubocop config
- basic testing setup
- removing EOL versions of ruby
- patching for any known CVEs

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-kafka/compare/d4eebcfed091899571e21c0e433cceb3e386d2c7...HEAD

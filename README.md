# echo_link
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/kevinelliott/echo_link?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fkevinelliott%2Fecho_link.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fkevinelliott%2Fecho_link?ref=badge_shield)

[![Gem Version](https://badge.fury.io/rb/echo_link.png)](http://badge.fury.io/rb/echo_link)

Retrieve information from the EchoLink network, such as link status and logins.

The [EchoLink](http://www.echolink.org/) is a network of amateur radio repeaters and software clients that are linked together across regions via the Internet using VoIP. The EchoLink allows people to make contact with others across the world without needing long distance (DX) equipment and licenses.

Related: See [kevinelliott/irlp](https://github.com/kevinelliott/irlp) and [kevinelliott/call_sign](https://github.com/kevinelliott/call_sign)

## Installation

Add this line to your application's Gemfile:

    gem 'echo_link'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install echo_link

## Usage

### Get links

```ruby
EchoLink::Scraper.new.links
```

which returns an `Array` of `Hash`es similar to:

```ruby
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fkevinelliott%2Fecho_link.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fkevinelliott%2Fecho_link?ref=badge_large)
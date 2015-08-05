# action_kit_rest

A ruby binding for the ActionKit REST API

[![Build Status](https://travis-ci.org/controlshift/action_kit_rest.svg)](https://travis-ci.org/controlshift/action_kit_rest)

## Usage

```ruby

ak = ActionKitRest.new(host: 'roboticdogs.actionkit.com', username: 'name', password: 'pass')
ak.import_page.create(title: "Title", name: "name")
ak.import_page.list.each do | page |
  puts page.name
end

```

With eventmachine:

```ruby
ak = ActionKitRest.new(host: 'roboticdogs.actionkit.com', username: 'name', password: 'pass', adapter: :em_synchrony)
```

### Languages

Get language by id and inspect it's iso code.

```ruby
language = ak.language.get '1'
language.iso_code
```

### Unsubscribe


```ruby
# First create a page
page = ak.unsubscribe_page.create(title: "Unsubscribe from API", name: "api_unsubscribes")
# page is now a page object
puts "created page: #{page.id}"

# create an unsubscribe action on the page we just created.
unsub = ak.unsubscribe_action.create(email: 'foo@bar.com', page: 'api_unsubscribes')

# unsub is now an action object with info about the unsub we just processed.

## Copyright

Copyright (c) 2013 ControlShift Ltd. See LICENSE.txt for
further details.


# action_kit_rest

A ruby binding for the ActionKit REST API

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

This is very experimental still, but starting to be usable.

## Copyright

Copyright (c) 2013 ControlShift Ltd. See LICENSE.txt for
further details.


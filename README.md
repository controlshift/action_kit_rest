# action\_kit\_rest

A ruby binding for the ActionKit REST API

[![CI Status](https://github.com/controlshift/action_kit_rest/actions/workflows/ci.yml/badge.svg)](https://github.com/controlshift/action_kit_rest/actions/workflows/ci.yml)

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
```

### Event Campaign Page

```ruby
# Can send any of the attributes described at the schema (https://roboticdogs.actionkit.com/rest/v1/campaign/schema/) plus a collection of tag URIs to
# apply to the event create and event signup pages
event_campaign = ak.event_campaign_page.create(name: 'global-march-2015', title: 'Global March 2015', event_pages_tags: ["/rest/v1/tag/1/", "/rest/v1/tag/99/"])

# The event_campaign object will include all the fields detailed on the schema plus the ID (as an integer, not as a URI) of the associated pages:
# * event_create_page_name
# * event_signup_page_name
```

### Event Create Action

Use this action for retrieving the eventcreateaction details (see the schema at: https://roboticdogs.actionkit.com/rest/v1/eventcreateaction/schema/).
**NOTE:** Cannot create actions through this resource, instead POST on /rest/v1/action/ with the page being an eventcreatepage for creating a new action of this type.

### Event

Use this object for retrieving and updating an existing event. For creating new events must POST an action on an eventcreatepage.

### Event Signup Action

Use this action for retrieving the eventsignup details (see the schema at: https://roboticdogs.actionkit.com/rest/v1/eventsignupaction/schema/).
**NOTE:** Cannot create actions through this resource, instead POST on /rest/v1/action/ with the page being an eventsignuppage for creating a new action of this type.

### Event Signup

Use this object for retrieving and updating an event attendee. For creating new attendees must POST an action on an eventsignuppage.

## Copyright

Copyright (c) 2013 ControlShift Ltd. See LICENSE.txt for
further details.


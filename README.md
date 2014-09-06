# AlterMvc

[![Code Climate](https://codeclimate.com/github/alterego-labs/alter_mvc/badges/gpa.svg)](https://codeclimate.com/github/alterego-labs/alter_mvc)
[![Test Coverage](https://codeclimate.com/github/alterego-labs/alter_mvc/badges/coverage.svg)](https://codeclimate.com/github/alterego-labs/alter_mvc)
[![Build Status](https://travis-ci.org/alterego-labs/alter_mvc.svg?branch=release_1_0_0)](https://travis-ci.org/alterego-labs/alter_mvc)

MVC concept was described in 1979 by Trygve Reenskaugom and despite the fact that the first reviews were not very positive, it finds its use to this day. Concept improved and complemented with new followers, depending on the capabilities of the platform and language, but the essence remains the same - to share data submission and processing of user actions on the individual components. Features of this separation become reuse and loose coupling components. But the more we dive into the Rails more feel imperfection MVC.
This gem provides for you tools for extending Rails's MVC by next components:

1. ModelQuery
2. ModelPresenter
3. ModelServiceObject
4. Responder
5. UseCase
6. ParameterSanitizer
7. Validator

At the next picture presented class diagram of my concept:

![Class diagram of alter_mvc concept](https://github.com/alterego-labs/alter_mvc/raw/master/lib/resources/alter_mvc.png "Class diagram of alter_mvc concept")

## Installation

Add this line to your application's Gemfile:

    gem 'alter_mvc', '0.1.0'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alter_mvc

## Usage

### ModelQuery

A model's wrapper for run some specific queries on it. For adding query object run following command:

```
$ rails generate alter_mvc:query User
```

And include AlterMvc::Concerns::Querable to appropriate model:

```
include AlterMvc::Concerns::Querable
```

### ModelPresenter

In this system acts as presenter providing access view to model.
ModelPresenter provides defining method for fetching information from
non-direct attributes (associations) and self-rendering feature. For
example, Post may has many view: small block on main page, as a line on
list page and post's show page. Rendering post's in this situation may
be done like this:

```
post.rendering as: :small_block, with: self #for small block on main
page

post.rendering as: :line, with: self #for line on list page

post.rendering as: :full_show, with: self #for post's show page
```

ModelPresenter also provides collection rendering feature:

```
posts.rendering as: :line, with: self
```

equivalents to:

```
posts.each { |post| post.rendering(as: :line, with: self) }
```

For self-rendering from example above you must adding templates to _app/views/posts/render_
with names _\_line.html.slim_, _small\_block.hmtl.slim_,
_\_full\_show.html.slim_.

For adding presenter object run:

```
$ rails generate alter_mvc:presenter Post
```

And include AlterMvc::Concerns::Presentable to appropriate model:

```
include AlterMvc::Concerns::Presentable
```

### ModelServiceObject

Contains model specific business rules. Run following command for adding
service object:

```
$ rails generate alter_mvc:service_object Post
```

And include AlterMvc::Concerns::ServiceObjectable to appropriate model:

```
include AlterMvc::Concerns::ServiceObjectable
```

### UseCase

Contains feature specific business rules. Extracting all logic to
UseCase makes controller thin and cleared. UseCases seems like as
scenario in USE-CASE diagram.

For adding new empty use case class run:

```
$ rails generate alter_mvc:use_case AddPost
```

### Responder

Make decision about what template will rendered and setting flash messages according to object state. For example, lets see next code:

```
class BookResponder < BasicResponder

  def create_js
    unless has_errors?
      controller.flash[:notice] = "Success booking!"
      render json: { status: :ok }
    else
      render json: { status: :error, errors: resource.errors.full_messages }
    end
  end

end

class BooksController < ApplicationController
  self.responder = BookResponder

  def create
    @book = Booking::AcceptOffer.new.run book_params
    respond_with @book
  end
end
```

Using Responder give to us some advantages:

1. Controller is so clear and using only for running specific use case
   and responding with it's result
2. More testable, DRY and SRP approach

For adding new responder run:

```
$ rails generate alter_mvc:responder Book
```

and add this line to appropriate controller:

```
class BooksController < ApplicationController
  self.responder = BookResponder
end
```

### ParameterSanitizer

Parsing income GET and POST parameters for use cases and provides objecting approach for accessing it. This gives single place for fetching income parameters and ability for using dependency injection when passing ParameterSanitizer object to UseCase.

For adding new ParameterSanitizer run:

```
$ rails generate alter_mvc:parameter_sanitizer PlacingBet
```

### Validator

Moving validation in additional layer helps us to hard-line divide between persistence layer and the actual domain logic.

For adding new Validator run:

```
$ rails generate alter_mvc:validator DraftPost
```

## CHANGES IN 0.1.0

1. Added ParameterSanitizer layer
2. Added Validator layer
3. Passing index to partial when rendering collection
4. Added options to collection rendering
5. Fixed bugs, refactoring and testing

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

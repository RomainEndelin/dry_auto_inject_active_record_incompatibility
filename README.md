# Dry Auto-Inject and ActiveRecord compatibility issue

## Important files:

- `app/initializers/dependency_manager.rb`

```ruby
module DependencyManager
  Container = Dry::Container.new

  Container.register(:hello) { 'world' }

  Import = Dry::AutoInject(Container)
end

```

- `app/models/user.rb`

```ruby
class User < ApplicationRecord
  include DependencyManager::Import[:hello]
end
```

## How to reproduce:

```ruby
irb(main):001:0> User.new.hello
=> "world"
irb(main):002:0> User.first.hello
  User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
=> nil
```
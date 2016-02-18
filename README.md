# Broogle

"Broogle" stands for "Home**br**ewed G**oogle**" (or for [Brain Google](http://ru.urbandictionary.com/define.php?term=broogle)
if you wish). It is a simple yet extensible full-text search engine written in ruby, mostly inspired by
[pg_search](https://github.com/Casecommons/pg_search) gem and [full-text-search](https://github.com/pokonski/full-text-search)
concept.

Broogle tries to be database-agnostic, so it doesn't use any fancy full-text search features that a modern relational
database provides ;) But it's still up to you to write and use a custom behaviour which exploits the power of your
stack.

## ActiveRecord

Broogle provides a mixin to use with any ActiveRecord model:

```ruby
class FamousQuote < ActiveRecord::Base
  include Broogle

  enable_search columns: [:author_name, :content], behaviors: [:trigram, :highlight], ranking: :trigram
end
```

## Behaviors

## Rankings

## Indexing

## TODOs

– Migration generator
– Separate config file for `QueryBuilder::DEFAULT_OPTIONS`
– Current indexer uses `before_save` hook, better create new one to use with Sidekiq (Behaviors::BackgroundAutoIndexer)
– Move options from concern to class

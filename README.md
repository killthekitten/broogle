# Broogle

"Broogle" stands for "Home**br**ewed G**oogle**" (or for [Brain Google](http://ru.urbandictionary.com/define.php?term=broogle)
if you wish). It is a simple yet extensible full-text search engine written in ruby, mostly inspired by
[pg_search](https://github.com/Casecommons/pg_search) gem and [full-text-search](https://github.com/pokonski/full-text-search)
concept.

Broogle tries to be database-agnostic, so it doesn't use any fancy full-text search features that a modern relational
database provides ;) But it's still up to you to write and use a custom behaviour which exploits the power of your
stack.

https://broogle.herokuapp.com/

## ActiveRecord

Broogle provides a mixin to use with any ActiveRecord model:

```ruby
class FamousQuote < ActiveRecord::Base
  include Broogle

  enable_search columns: [:author_name, :content], behaviors: [:trigram, :highlight], ranking: :trigram
end
```

## Behaviors

Any sort of additional functionality, which can be mixed in on every level: indexing, querying, displaying.
Available behaviors: `AutoIndexer`, `Highlighter`.

## Rankings

Rankings. Default ranking (`DumbRanking`) counts matches.

## Sortings

Default sorting (`DumbSorting`) sorts only by ranking.

## Stemmers

Default stemmer (`DumbStemmer`) uses gem `fast-stemmer` (took from @pokonski's repo).

## Splitter

Default splitter (`DumbSplitter`) splits according to special array within the splitter (took from @pokonski's repo).

## TODOs

- [ ] Migration generator
- [ ] Separate config file for `QueryBuilder::DEFAULT_OPTIONS`
- [ ] Current indexer uses `before_save` hook, better create new one to use with Sidekiq (Behaviors::BackgroundAutoIndexer)
- [x] Move options from concern to class

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

Behavior should be implemented as a module, with an optional `QueryPatch` class defined within:

```ruby
module Broogle
  module Behaviors
    module Highlighter
      extend ActiveSupport::Concern

      class QueryPatch
        attr_reader :query

        def initialize(query)
          @query = query
        end

        def patched_query
          query.select("#{query.table_name}.*, ARRAY_AGG(broogle_stems.matched_string) AS highlights")
        end
      end
    end
  end
end

module Broogle
  module Behaviors
    module AutoIndexer
      extend ActiveSupport::Concern

      included do
        after_save :update_broogle_terms!
      end
    end
  end
end
```

## Rankers

Default ranker (`DumbRanker`) counts matches.

## Orderers

Default orderer (`DumbOrderer`) orders by ranking. It depends on existence of column `rank`, which is expected to be
provided by any ranker.

## Stemmers

Default stemmer (`DumbStemmer`) uses gem `fast-stemmer` (took from @pokonski's repo).

## Splitter

Default splitter (`DumbSplitter`) splits according to special array within the splitter (took from @pokonski's repo).

## TODOs

- [ ] Migration generator
- [ ] Separate config file for `QueryBuilder::DEFAULT_OPTIONS`
- [ ] Current indexer uses `before_save` hook, better create new one to use with Sidekiq (Behaviors::BackgroundAutoIndexer)
- [x] Move options from concern to class
- [ ] Search engine elements should be less coupled (i.e. `DumbOrderer` knows about `DumbRanker`, `DumbRanker` expects query to be grouped etc.)

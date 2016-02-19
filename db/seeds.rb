quote_attributes =
  [
    {
      author: "Marilyn Monroe",
      content: <<-END
        I believe that everything happens for a reason. People change so that you can learn to let go, things
        go wrong so that you appreciate them when they're right, you believe lies so you eventually learn to
        trust no one but yourself, and sometimes good things fall apart so better things can fall together.
      END
    },
    {
      author: "H. Jackson Brown Jr.",
      content: <<-END
        Twenty years from now you will be more disappointed by the things that you didn't do than by the ones
        you did do. So throw off the bowlines. Sail away from the safe harbor. Catch the trade winds in your sails.
        Explore. Dream. Discover.
    END
    },
    {
      author: "J.R.R. Tolkien",
      content: <<-END
        All that is gold does not glitter,
        Not all those who wander are lost;
        The old that is strong does not wither,
        Deep roots are not reached by the frost.

        From the ashes a fire shall be woken,
        A light from the shadows shall spring;
        Renewed shall be blade that was broken,
        The crownless again shall be king.
      END
    },
    {
      author: "Douglas Adams",
      content: <<-END
        I love deadlines. I love the whooshing noise they make as they go by.
      END
    },
    {
      author: "Ayn Rand",
      content: <<-END
        Do not let your fire go out, spark by irreplaceable spark in the hopeless swamps of the not-quite,
        the not-yet, and the not-at-all. Do not let the hero in your soul perish in lonely frustration for the life you
        deserved and have never been able to reach. The world you desire can be won.
        It exists.. it is real.. it is possible.. it's yours.
      END
    },
    {
      author: "David Mitchell",
      content: <<-END
        People pontificate, "Suicide is selfishness." Career churchmen like Pater go a step further and call in a
        cowardly assault on the living.

        Oafs argue this specious line for varying reason: to evade fingers of blame, to
        impress one's audience with one's mental fiber, to vent anger, or just because one lacks the necessary
        suffering to sympathize.

        Cowardice is nothing to do with it - suicide takes considerable courage. Japanese have the right idea.
        No, what's selfish is to demand another to endure an intolerable existence, just to spare families, friends,
        and enemies a bit of soul-searching.
      END
    },
    {
      author: "C.S. Lewis",
      content: <<-END
        To love at all is to be vulnerable. Love anything and your heart will be wrung and possibly broken.
        If you want to make sure of keeping it intact you must give it to no one, not even an animal.

        Wrap it carefully round with hobbies and little luxuries; avoid all entanglements.
        Lock it up safe in the casket or coffin of your selfishness. But in that casket, safe, dark, motionless,
        airless, it will change. It will not be broken; it will become unbreakable, impenetrable, irredeemable.

        To love is to be vulnerable.
      END
    },
    {
      author: "Terry Pratchett",
      content: <<-END
        All witches are selfish, the Queen had said. But Tiffany’s Third Thoughts said: Then turn selfishness into a
        weapon! Make all things yours!
        Make other lives and dreams and hopes yours! Protect them! Save them! Bring them into the sheepfold!
        Walk the gale for them! Keep away the wolf! My dreams! My brother! My family! My land! My world!

        How dare you try to take these things, because they are mine!
      END
    },
    {
      author: "Terry Pratchett",
      content: <<-END
        Love is always ready to deny itself, to give, sacrifice, just in the measure of its sincerity and intensity.
        Perfect love is perfect self-forgetfulness. Hence where there is love in a home, unselfishness is the law.
        Each forgets self and lives for others.

        But where there is selfishness it mars joy. One selfish soul will destroy the sweetness of life in any home.
        It is like an ugly bush in the midst of a garden of flowers. It was selfishness that destroyed the first home
        and blighted all the loveliness of Paradise; and it has been blighting lovely things in earth's home ever since.
        We need to guard against this spirit.
      END
    }
  ]

quote_attributes.each do |attributes|
  attributes[:content] = attributes[:content].strip_heredoc.gsub(/(?<!\n)\n(?!\n)/, " ")
  FamousQuote.create! attributes
end

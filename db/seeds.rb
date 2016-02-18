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
    }
  ]

quote_attributes.each do |attributes|
  attributes[:content] = attributes[:content].strip_heredoc.gsub("\n", " ")
  FamousQuote.create! attributes
end

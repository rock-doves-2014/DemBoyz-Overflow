# Review

## Startup

:(.  Seeds file blows up.  `seeds.rb` is broken.  We should performantly find a
`question_id`

...or not....the seed file is out of date because of
`db/migrate/20150117001158_remove_question_id_from_tags.rb`

Be sure to get the seeds file migrated.  The seed file represents to a
programmer new to your codebase what your expectations are about how your
universe is constructed.  It's a basic tour if the entire application.  If i
can't get the seeds to run, I'm not sure I want to step into that universe.

## Testing

Broken.  We generally don't want to have our tests on `master` be broken.  If
they are off, that's cool, if they are pending, that's OK, if they are removed,
that's also OK, but the one thing they cannot be is broken.

The volume is pretty good.  Not using factories properly, not using `let` or
`let!`.  Do some review on this.  Look at what i fixed live in the
TagsController spec.  Review the book, but if you have questions follow-up with
me.

## Migrations

Nice constraints. Nice use of migrations to change the schema.

## ActiveRecord

There's some wokiness in e.g. `Tag`...we can use the builtins to save us some
stress.

## Controllers

Nice and focused.  I like that you're pushing logic into models, even if that
implementation might be a bit off, you're constraining it into a nice place.

## Views

Pretty clean.

## Overal

Biggest weaknesses were the testing framework and not leveraging ActiveRecord.


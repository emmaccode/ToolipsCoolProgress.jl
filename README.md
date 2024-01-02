#### cool progress bars!
Some cool progress bars I have made, and some `ComponentModifier` functions to update them.
###### contents
- [circular progress](#circular-progress)
- [circular progress with text](#circular-progress-with-text)
- [bottom progress](#bottom-progress)
- [update progress](#update-progress)
- [example](#example)
###### circular progress

###### circular progress with text

###### bottom progress

###### update progress
`update_progress!` is a simple method used to update all of these progress bars. Because the calls are **type specific,** you will have to provide the `Component`.
```julia
    on(c, prog, "click") do cm::ComponentModifier
        update_progress!(cm, prog, 50)
    end
```
###### example

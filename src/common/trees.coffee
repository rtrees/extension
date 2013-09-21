class Trees
  @Version: "1.0"
  @Features: {}

  features: {}

  constructor: ->
    @registerFeatures()

  registerFeatures: (feature) ->
    for klass, Feature of Trees.Features
      @features[Feature.id] = new Feature({ trees: @ })
    @

module?.exports = Trees
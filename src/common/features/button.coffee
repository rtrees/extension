class Trees.Features.Button extends Trees.Feature
  @id: "button"
  @name: "420 Button"
  @description: "A button that is shown on r/trees at 4:20"

  onDOMReady: ->
    @render()

  render: ->
    if @is420()
      header = @$("#header")

  is420: ->
    now = new Date()
    hours = now.getHours()
    minutes = now.getMinutes()
    (hours == 4 || hours == 16) && (minutes > 15 && minutes < 25)
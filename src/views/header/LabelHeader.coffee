k = require "koala-js"
view = require("backbone-viewj")
dom = require("dom-helper")

module.exports = LabelHeader = view.extend

  className: "biojs_msa_headers"

  initialize: (data) ->
    @g = data.g

  render: ->

    dom.removeAllChilds @el

    width = 0
    width += @g.zoomer.get "labelWidth" if @g.vis.get "labels"
    width += @g.zoomer.get "metaWidth" if @g.vis.get "metacell"
    @el.style.width = width + "px"

    if @g.vis.get "labels"
      @el.appendChild @labelDOM()

    if @g.vis.get "metacell"
      @el.appendChild @metaDOM()

    @el.style.display = "inline-block"
    @el.style.fontSize = @g.zoomer.get "markerFontsize"
    @

  labelDOM: ->
    labelHeader = k.mk "div"
    labelHeader.style.width = @g.zoomer.get "labelWidth"
    labelHeader.style.display = "inline-block"

    if @.g.vis.get "labelCheckbox"
      labelHeader.appendChild @addEl(".", 10)

    if @.g.vis.get "labelId"
      labelHeader.appendChild @addEl("id", @g.zoomer.get "labelIdLength")

    if @.g.vis.get "labelPartition"
      labelHeader.appendChild @addEl("part", 15)

    if @.g.vis.get "labelName"
      name = @addEl("name")
      #name.style.marginLeft = "50px"
      labelHeader.appendChild name

    labelHeader

  addEl: (content, width) ->
    id = document.createElement "span"
    id.textContent = content
    if width?
      id.style.width = width + "px"
    id.style.display = "inline-block"
    id

  metaDOM: ->
    metaHeader = k.mk "div"
    metaHeader.style.width = @g.zoomer.get "metaWidth"
    metaHeader.style.display = "inline-block"

    metaHeader.appendChild @addEl("gaps", 35)
    metaHeader.appendChild @addEl("ident", 40)
    metaHeader.appendChild @addEl("links")

    metaHeader

'use strict'

angular.module 'csiiApp'
.directive 'bookProgress', ->
  restrict: 'E',
  scope:
    data: "="
  link: (scope, element, attrs) ->

    width = 300
    height = 300
    radius = Math.min(width, height) / 2;
    pi = Math.PI

    bookPerc = () ->
      [{ value: .8,  index: .5 }]

    tweenArc = (b) ->
      (a) ->
        i = d3.interpolate b,a
        a[key] = b[key] for key of b
        (t) ->
          arc i t

    arcTween = () ->
      d3.select this
        .transition()
        .duration 3000
        .attrTween 'd', tweenArc { value: 0 }

    arc = d3.svg.arc()
    .outerRadius(radius - 10)
    .innerRadius(radius - 40)
    .startAngle 0
    .endAngle (d) -> d.value * 2 * Math.PI

    svg = d3.select 'body'
      .append 'svg'
      .attr 'width', width
      .attr 'height', height
        .append 'g'
      .attr 'transform', 'translate(' + width / 2 + ',' + height / 2 + ')'

    g = svg.selectAll 'g'
      .data scope.data
        .enter().append 'g'
      .attr 'class', 'arc'

    g.append 'path'
      .style 'fill', '#FF0100'
      .attr 'd', arc

    d3.selectAll 'g.arc > path'
      .each arcTween

### margin =
   top: 20
   right: 20
   bottom: 30
   left: 40
 width = 480 - margin.left - margin.right
 height = 360 - margin.top - margin.bottom
 svg = d3.select element[0]
   .append 'svg'
   .attr 'width', width + margin.left + margin.right
   .attr 'height', height + margin.top + margin.bottom
   .append 'g'
     .attr 'transform', 'translate(' + margin.left + ',' + margin.top + ')'

 x = d3.scale.ordinal().rangeRoundBands [0, width], .1
 y = d3.scale.linear().range [height, 0]

 xAxis = d3.svg.axis()
   .scale x
   .orient 'bottom'

 yAxis = d3.svg.axis()
   .scale y
   .orient 'left'
   .ticks 10

 scope.render = (data) ->
   x.domain data.map (d) -> d.name
   y.domain [0, d3.max data, (d) -> d.count]

   svg.selectAll 'g.axis'
     .remove()
   svg.append 'g'
     .attr 'class', 'x axis'
     .attr 'transform', 'translate(0,' + height + ')'
     .call xAxis

   svg.append 'g'
     .attr 'class', 'y axis'
     .call yAxis
     .append 'text'
     .attr 'transform', 'rotate(-90)'
     .attr 'y', 6
     .attr 'dy', .7
     .style 'text-anchor', 'end'
     .text 'Count'

   bars = svg.selectAll '.bar'
     .data data
   bars.enter()
     .append 'rect'
     .attr 'class', 'bar'
     .attr 'x', (d) -> x(d.name)
     .attr 'width', x.rangeBand()

   bars
     .transition()
     .duration 1000
     .attr 'height', (d) -> height - y d.count
     .attr 'y', (d) -> y d.count

 scope.$watch 'data', () ->
   scope.render scope.data
 , true ###




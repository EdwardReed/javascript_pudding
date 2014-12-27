# @cjsx React.DOM

# This is based on a SO answer from Ben Alpert: http://stackoverflow.com/a/20796299
TabbedArea = require('react-bootstrap').TabbedArea
TabPane = require('react-bootstrap').TabPane


Cell = React.createClass
  handleChange: (event) ->
    @props.onChange(event.target.value)

  render: ->
    <input value={@props.data} onChange={@handleChange} />


Row = React.createClass
  handleChange: (columnName, cellVal) ->
    @props.onCellChange(columnName, cellVal)

  render: ->
    # cellVal is occasionally zip code, but it's not being set as a key and it's still breaking
    cells = _.map @props.data, (cellVal, columnName, list) =>
      <td><Cell key={_.uniqueId()} data={cellVal} onChange={@handleChange.bind(null, columnName)} /></td>

    <tr>{cells}</tr>


Grid = React.createClass
  render: ->
    headers = _.map _.keys(@props.data[0]), (key, index) =>
      <th key={index}>{key}</th>

    rows = _.map @props.data, (rowData, rowIndex) =>
      <Row key={rowIndex} data={rowData} onCellChange={@props.onCellChange.bind(null, rowIndex)} />

    <table className="table table-condensed">
      <thead>
        <tr>{headers}</tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>


DataEditor = React.createClass
  getInitialState: ->
    data: @props.initialData

  # attempt to convert it to a number. If it fails, return the original string. Otherwise, return the number
  convertCellVal: (val) ->
    num = parseFloat(val)
    if _.isNaN(num) then val else num

  handleCellChange: (tableName, rowIndex, columnName, cellVal) ->
    console.log('tableName, rowIndex, columnName, cellVal:: ', tableName, rowIndex, columnName, cellVal)
    table = _.clone(@state.data[tableName])
    table[rowIndex][columnName] = @convertCellVal(cellVal)
    tables = _.clone(@state.data)
    table[tableName] = table
    @setState({data: tables})

  handleButtonClick: (event) ->
    console.log(@.state.data)

  render: ->
    tabs = _.map @state.data, (tableData, tableName) =>
      <TabPane key={tableName} tab={tableName}>
        <Grid data={tableData} onCellChange={@handleCellChange.bind(null, tableName)} />
      </TabPane>

    <div className="data-editor">
      <TabbedArea defaultActiveKey={_.keys(@state.data)[0]}>
        {tabs}
      </TabbedArea>
    </div>


module.exports = DataEditor

# @csjx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  _handleOnSubmit: (e) ->
    e.preventDefault()

    searchValue = @refs.search.getDOMNode().value.trim()
    @props.onFormSubmit(searchValue)

  render: ->
    <form onInput={@_handleOnSubmit}>
      <div className='form-group'>
        <input ref='search' className='form-control' placeholder='Search people by email...' type='text' />
      </div>
    </form>

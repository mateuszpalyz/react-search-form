# @csjx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  componentDidMount: ->
    @_subscribeToEvents()

  componentWillUnmount: ->
    @_unsubscribeFromEvents()

  _subscribeToEvents: ->
    PubSub.subscribe 'resetButton:onClick', ()=>
      @refs.search.getDOMNode().value = ''

  _unsubscribeFromEvents: ->
    PubSub.unsubscribe 'resetButton:onClick'

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

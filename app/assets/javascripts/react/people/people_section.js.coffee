# @cjsx React.DOM

@PeopleSection = React.createClass
  diplayName: 'PeopleSection'

  getInitialState: ->
    didFetchData: false
    people: []
    meta:
      total_pages: 0
      current_page: 1
      total_count: 0
    fetchData:
      search: ''
      page: 1

  componentDidMount: ->
    @_fetchPeople({})

  _fetchPeople: (data)->
    $.ajax
      url: Routes.people_path()
      dataType: 'json'
      data: @state.fetchData
    .done @_fetchDataDone
    .fail @_fetchDataFail

  _fetchDataDone: (data, textStatus, jqXHR) ->
    @setState
      didFetchData: true
      people: data.people
      meta: data.meta

  _fetchDataFail: (xhr, status, err) =>
    console.error @props.url, status, err.toString()

  _handleOnSearchSubmit: (search) ->
    @_fetchPeople
      search: search

  _handleOnPaginate: (pageNumber) ->
    @state.fetchData.page = pageNumber
    @_fetchPeople()

  render: ->
    cardsNode = @state.people.map (person) ->
      <PersonCard key={person.id} data={person}/>

    noDataNode =
      <div className="warning">
        <span className>
          <i className="fa fa-meh-o fa-stack-2x"></i>
        </span>
        <h4>No people found...</h4>
      </div>

    <div>
      <PaginatorSection totalPages={@state.meta.total_pages} currentPage={@state.meta.current_page} onPaginate={@_handleOnPaginate} />
      <PeopleSearch onFormSubmit={@_handleOnSearchSubmit}/>
      <div className="cards-wrapper">
        {
          if @state.people.length > 0
            {cardsNode}
          else if @state.didFetchData
            {noDataNode}
        }
      </div>
    </div>

# @cjsx React.DOM

@PersonCard = React.createClass
  displayName: 'PersonCard'

  render: ->
    <div className='card'>
      <ul>
        <li>
          <i className="fa fa-user"></i>
          { ' ' + @props.data.first_name + ' ' + @props.data.last_name }
        </li>
        <li>
          <i className="fa fa-envelope"></i>
          { ' ' + @props.data.email }
        </li>
      </ul>
    </div>

'use strict';

var LifeCycle = function(RootEl) {
  const lifecycle = {
	componentDidMount: 'componentDidMount',
	componentWillUnmount: 'componentWillUnmount',
  }

  var order = ['init', 'render', 'componentDidMount', 'componentWillUnmount'];

  // Instantiate components
  const cell = RootEl();

  // initialize the component
  //cell.init();
  
  var renderReturnHTML = cell.render();

  /* TODO parse.
	* From this point html string has to be parsed.
	* Hiherto, your html string is in JSX format.
	* 
	* Q. Decide on whether this html should be JSX
	* 	 or something else, and then how to parse it?
	*/
  //parse(renderReturnHTML);
}

export default LifeCycle;

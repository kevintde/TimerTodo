<script>

	import Box from './Box.svelte';
	let todos = [
		{ done: false, text: 'finish Svelte tutorial', timerrun: false, seconds: 0 },
		{ done: false, text: 'build an app', timerrun: false, seconds: 0 },
		{ done: false, text: 'world domination', timerrun: false, seconds: 0}
	];
	if (typeof window !== 'undefined') {
			  loaddata();
			} 


	var timerVariable = setInterval(countUpTimer, 1000);	
	let secondsaftersave = 0;

	

	$: remaining = todos.filter(t => !t.done).length;
	function countUpTimer(){
		for (let i = 0; i < remaining; i++){
			if(todos[i].timerrun == true){
				todos[i].seconds = todos[i].seconds +1;
			}
					}
		secondsaftersave++;
		if(secondsaftersave > 60){
			secondsaftersave = 0;
			if (typeof window !== 'undefined') {
			  savedata();
			} 
		}

	}



	function add() {
		todos = todos.concat({ done: false, text: '' , timerrun: false, seconds: 0});
		timers = timers.concat({seconds: 0, minutes: 0, timerrun: false, seconds: 0});
	}
	function stopalltimers() {
		for (let i = 0; i < remaining; i++){
			todos[i].timerrun = false
				
			


		}	}

	function clear() {
		todos = todos.filter(t => !t.done);
	}
	function loaddata(){
		const localstorageload = localStorage.getItem("Settings");
		const parsedObj = JSON.parse(localstorageload);
		todos = parsedObj;
		console.log('Loading Data');

	}
	function savedata(){
		// convert object to JSON string
		// using JSON.stringify()
		const jsonObj = JSON.stringify(todos);

		// save to localStorage
		localStorage.setItem("Settings", jsonObj);
		console.log('Saving Data');

	}



</script>

<h1>Todos</h1>

{#each todos as todo}
	<div>
		<Box>
		<input	type=checkbox bind:checked={todo.done}>
		<input placeholder="What needs to be done?" bind:value={todo.text}	disabled={todo.done}	>
			<br>
		<input	type=checkbox bind:checked={todo.timerrun}	>
		<input type=number bind:value={todo.seconds}>
		
		<p><strong>Minuten:</strong> {(todo.seconds / 60).toFixed(2)}</p>




		</Box>
	</div>
{/each}

<p>{remaining} remaining</p>

<button on:click={add}>
	Add new
</button>
<button on:click={stopalltimers}>
	Stop all Timers
</button>

<button on:click={clear}>
	Clear completed
</button>
<br>

<button on:click={loaddata}>
	Load Data
</button>
<button on:click={savedata}>
	Sava Data
</button>

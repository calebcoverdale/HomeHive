<script>
	// Define the labels for your inventory-related cards
	let cards = [
		{ label: 'Total Items', count: 120 },
		{ label: 'In Stock', count: 85 },
		{ label: 'Out of Stock', count: 20 },
		{ label: 'Low Stock', count: 15 }
	];
</script>

<svelte:head>
	<title>Dashboard</title>
	<!-- Updated title to "Dashboard" -->
	<meta name="description" content="Inventory Dashboard" />
</svelte:head>

<div class="text-column">
	<h1>Inventory Dashboard</h1>

	<div class="dashboard">
		{#each cards as card}
			<div class="card">
				<p class="label">{card.label}</p>
				<p class="count">{card.count}</p>
			</div>
		{/each}
	</div>
</div>

<style>
	/* Add your custom styles for the Dashboard here */
	/* You can also include the styles from the previous code here */
</style>

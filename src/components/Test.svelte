<script>
	let { testProp } = $props();
	let testState = $state(testProp);
</script>

<div class="div" class:active={testState}>
	<button onclick={() => (testState = !testState)}>
		{testState}
	</button>
</div>

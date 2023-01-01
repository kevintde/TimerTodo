import adapter from '@sveltejs/adapter-node';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter()
	}
};

export default {
	kit: {
  
	adapter: adapter({ out: 'buildexport' })
	}
  };
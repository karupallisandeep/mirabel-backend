const https = require('https');

const API_URL = 'https://8kihckwkhf.execute-api.us-east-1.amazonaws.com/graphql';

function makeGraphQLRequest(query) {
  return new Promise((resolve, reject) => {
    const data = JSON.stringify({ query });
    
    const options = {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': data.length
      }
    };

    const req = https.request(API_URL, options, (res) => {
      let body = '';
      res.on('data', (chunk) => body += chunk);
      res.on('end', () => {
        try {
          const result = JSON.parse(body);
          resolve(result);
        } catch (error) {
          reject(error);
        }
      });
    });

    req.on('error', reject);
    req.write(data);
    req.end();
  });
}

async function testAPI() {
  console.log('🧪 Testing GraphQL API...\n');

  try {
    // Test 1: Health check
    console.log('1. Testing health endpoint...');
    const healthResult = await makeGraphQLRequest('{ health }');
    console.log('✅ Health:', JSON.stringify(healthResult, null, 2));

    // Test 2: Products query
    console.log('\n2. Testing products query...');
    const productsResult = await makeGraphQLRequest(`
      { 
        products(limit: 5) { 
          products { 
            id 
            name 
            type 
            basePrice 
            isActive 
          } 
          totalCount 
          hasMore 
        } 
      }
    `);
    console.log('✅ Products:', JSON.stringify(productsResult, null, 2));

    // Test 3: Product stats
    console.log('\n3. Testing product stats...');
    const statsResult = await makeGraphQLRequest(`
      { 
        productStats { 
          totalProducts 
          activeProducts 
          averagePrice 
        } 
      }
    `);
    console.log('✅ Stats:', JSON.stringify(statsResult, null, 2));

    // Test 4: Search products
    console.log('\n4. Testing search functionality...');
    const searchResult = await makeGraphQLRequest(`
      { 
        searchProducts(searchTerm: "test", limit: 3) { 
          id 
          name 
          type 
        } 
      }
    `);
    console.log('✅ Search:', JSON.stringify(searchResult, null, 2));

  } catch (error) {
    console.error('❌ API Test failed:', error.message);
  }
}

testAPI();
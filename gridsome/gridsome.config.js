module.exports = {
  templates: {
    // Add templates for content types here.
    // Read more: https://gridsome.org/docs/templates/
  },
  plugins: [
    {
      use: '@gridsome/source-graphql',
      options: {
        // TODO: env configuration
        url: 'http://localhost:8000/api/graphql',

        fieldName: 'wagtail',
        // typeName: 'puppyTypes',

        // headers: {
        //   Authorization: `Bearer ${process.env.AUTH_TOKEN}`,
        // },
      },
    },
  ]
}

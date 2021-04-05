<template>
  <Layout>
    <g-image alt="Example image" src="~/favicon.png" width="135" />
    <u>Latest posts</u>
    <div v-for="page in $page.wagtail.pages" :key="page.id">
      <h2>{{ page.title }}</h2>
      <p class="headline">{{ page.headline}}</p>
      <img class="thumb">{{ page.}}
    </div>
  </Layout>
</template>

<script>
export default {}
</script>

<page-query>
query Wagtail {
  wagtail: wagtail {
      pages {
    	...on wagtail_FlexPage {
        id,
        slug,
      	title,
        headline,
        body,
        attach {
          rawValue
          ...on wagtail_ImageChooserBlock {
            image {
              url
            }
          }
        }
      }
    }
  }
}
</page-query>

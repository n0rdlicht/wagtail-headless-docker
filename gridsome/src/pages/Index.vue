<template>
  <Layout>
    <g-image alt="Example image" src="~/favicon.png" width="135" />
    <h1>Latest posts</h1>
    <div v-for="page in $page.wagtail.pages" :key="page.id">
      <h2>{{ page.title }}</h2>
      <p class="headline">{{ page.headline}}</p>
      <img class="thumb" :src="page.bannerImage.url" width="400">
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
        id, slug,
      	title, headline, body,
        bannerImage {
          url
        },
        content {
          ...on wagtail_ImageChooserBlock {
            image {
              title, file
            }
          }
        }
      }
    }
  }
}
</page-query>

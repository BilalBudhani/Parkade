<template>
  <Layout>
    <div class="py-4 flex items-center">
      <h2 class="font-bold text-4xl">Park A Domain</h2>
    </div>
    <Card>
      <FormulateForm @submit="handleSubmit" v-model="form" :errors="errors">
        <FormulateInput
          type="text"
          label="Domain"
          placeholder="awesomeinc.com"
          validation="required"
          name="name"
        />
        <FormulateInput
          type="text"
          label="Title"
          placeholder="My Awesome Product Domain"
          name="title"
        />
        <FormulateInput
          type="textarea"
          label="Description"
          placeholder="Give some context about your domain"
          name="description"
        />
        <FormulateInput
          type="textarea"
          label="Head scripts"
          placeholder="Drop your JS code here for <head> tag"
          name="head_scripts"
        />
        <FormulateInput
          type="textarea"
          label="Body scripts"
          placeholder="Drop your JS code here before </body> tag"
          name="footer_scripts"
        />
        <button class="px-4 py-2 bg-indigo-400 text-white rounded flex items-center font-medium">Submit</button>
      </FormulateForm>
    </Card>
  </Layout>
</template>

<script>
export default {
  props: ['errors'],
  data() {
    return {
      form: {},
    };
  },
  methods: {
    handleSubmit(data) {
      this.$inertia.post('/domains', {
        domain: data
      })
    }
  }
}
</script>
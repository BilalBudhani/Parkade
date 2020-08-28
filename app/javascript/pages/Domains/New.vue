<template>
  <Layout>
    <div class="py-4 flex items-center">
      <h4>Add Domain</h4>
    </div>
    <Card>
      <FormulateForm @submit="handleSubmit" v-model="form">
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
        <button class="btn-primary">Submit</button>
      </FormulateForm>
    </Card>
  </Layout>
</template>

<script>
export default {
  data() {
    return {
      form: {}
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
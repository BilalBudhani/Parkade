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
<template>
  <Layout>
    <Card>
      <h2 class="text-3xl my-2 font-bold leading-tight">{{domain.name}}</h2>

      <p class="text-xl text-gray-800">Please add an <span class="bg-gray-300 font-semibold px-2 text-black">A</span> record to your domain's DNS to complete the installation.</p>

      <div class="p-4 text-white bg-black mt-4">
        <code>
          {{server_ip}}
        </code>
      </div>

      <div class="text-center py-2 mt-4">
        <inertia-link :href="'/domains/' + domain.id + '/verify'" class="text-white bg-green-500 p-2 rounded">Verify DNS</inertia-link>
      </div>

    </Card>
  </Layout>
</template>

<script>
export default {
  props: ["domain", "server_ip"]
}
</script>

<style>

</style>
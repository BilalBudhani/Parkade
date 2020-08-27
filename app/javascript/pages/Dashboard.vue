<template>
  <Layout>

    <div class="flex justify-end items-center py-4">
      <inertia-link href="/domains/new" class="btn-primary flex items-center">
        <PlusIcon class="w-4 h-4 mr-2" />
        Add Domain
      </inertia-link>
    </div>

    <Card>
      <div v-for="(domain, key) in domains" :key="domain.id" class="py-6 px-6 flex justify-between items-center" :class="{'border-t': key !== 0 }">
        <div class="flex items-center">
          <inertia-link :href="'/domains/' + domain.id + '/setup'" class="font-bold text-lg">
            {{domain.name}}
          </inertia-link>
        </div>
        <div>
          {{domain.status}}
        </div>
      </div>
    </Card>
  </Layout>
</template>

<script>
export default {
  props: ['domains']
}
</script>
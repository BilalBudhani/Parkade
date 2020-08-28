<template>
  <Layout>

    <div class="flex justify-between items-center py-2 mb-2">
      <h2 class="font-bold text-4xl">Your Domains</h2>
      <inertia-link href="/domains/new" class="px-4 py-2 bg-indigo-400 text-white rounded flex items-center font-medium">
        <PlusIcon class="w-4 h-4 mr-2" />
        Park A Domain
      </inertia-link>
    </div>

    <Card>
      <div v-for="(domain, key) in domains" :key="domain.id" class="py-6 px-6 flex justify-between items-center w-full" :class="{'border-t': key !== 0 }">
        <div>
          <inertia-link :href="'/domains/' + domain.id + '/setup'" class="font-bold text-lg">
            {{domain.name}}
          </inertia-link>
        </div>
        <div>
          <span class="inline-flex items-center px-4 py-1 rounded text-xs font-semibold leading-5" :class="statusBadgeColor(domain)">
            {{titleize(domain.status)}}
          </span>
        </div>
      </div>

      <section v-if="domains.length === 0" class="p-4 text-center">
        <p class="text-xl font-semibold italic text-gray-400">Nothing is more expensive than a missed opportunity.</p>
      </section>
    </Card>
  </Layout>
</template>

<script>
import startCase from "lodash/startCase";
export default {
  props: ['domains'],
  methods: {
    statusBadgeColor(domain) {
      if (domain.status === 'pending') {
        return 'bg-orange-200 text-orange-800'
      } else if (domain.status === 'verified') {
        return 'bg-green-200 text-green-800'
      } else {
        return 'bg-red-200 text-red-800'
      }
    },
    titleize(value) {
      return startCase(value);
    }
  }
}
</script>
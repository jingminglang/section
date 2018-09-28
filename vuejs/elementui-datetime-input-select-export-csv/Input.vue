<template>
  <div>
    <el-input  v-model="input" :placeholder="inputName" @change="onChange"></el-input>
  </div>
</template>
<script>
export default {
  props: ['inputName', 'options', 'eventName', 'value'],
  methods: {
    onChange (v) {
      this.$emit('up', { name: this.eventName, value: v })
    }
  },
  data () {
    return {
      inputName: '请输入',
      input: ''
    }
  }
}
</script>

<template>
  <el-select v-model="value" filterable clearable :placeholder="inputName" @change="onSelect">
    <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
    </el-option>
  </el-select>
</template>

<script>
export default {
  props: ['inputName', 'options', 'eventName', 'value'],
  methods: {
    onSelect (v) {
      this.$emit('up', { name: this.eventName, value: v })
    }
  },
  data () {
    return {
      inputName: '请选择'
      // options: [],
      // value: ''
    }
  }
}
</script>

<template>
    <el-date-picker
      v-model="value"
      @change="onSelect"
      type="datetimerange"
      range-separator="至"
      start-placeholder="开始日期"
      end-placeholder="结束日期">
    </el-date-picker>
</template>
<script>
export default {
  props: ['eventName', 'start', 'end'],
  methods: {
    onSelect (v) {
      this.$emit('up', { name: this.eventName, start: v[0].getTime(), end: v[1].getTime() })
    }
  },
  data () {
    return {
      // inputName: '请选择'
      // options: [],
      start: '',
      end: '',
      value: ''
    }
  }
}
</script>


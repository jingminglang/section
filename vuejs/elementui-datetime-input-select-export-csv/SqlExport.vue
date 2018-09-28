<template>
  <div>
    <el-row>
      <el-col :span="6">
        <sql-export-input @up="event" eventName='ip' inputName='数据库地址:' :options="envOptions" :value="selectedEnv"></sql-export-input>
      </el-col>

      <el-col :span="3">
        <sql-export-input @up="event" eventName='dataBaseName' inputName='数据库:' :options="envOptions" :value="selectedEnv"></sql-export-input>
      </el-col>

      <el-col :span="3">
        <sql-export-input @up="event" eventName='tableName' inputName='数据库表:' :options="envOptions" :value="selectedEnv"></sql-export-input>
      </el-col>

      <el-col :span="2">
        <sql-export-input @up="event" eventName='pageNum' inputName='第几个10万行数据:1' :options="envOptions" :value="selectedEnv"></sql-export-input>
      </el-col>


      <el-col :span="4">
        <sql-export-dateTime @up="event" eventName='dateTime'></sql-export-dateTime>
      </el-col>

      <el-col :offset="2" :span="2">
        <sql-export-select @up="event" eventName='sqlType' inputName='sql类型' :options="sqlTypeOptions" :value="selectedEnv"></sql-export-select>
      </el-col>

      <el-col :span="2">
        <el-button @click="exportSql" type="primary" size="small">导出</el-button>
      </el-col>
    </el-row>
    <!-- <div style="margin-top:20px">
   <el-row>
      <el-col :offset="20" :span="4">
          <el-button @click="exportSql" type="primary" size="small">导出</el-button>
      </el-col>
   </el-row> -->
    <!-- </div> -->
  </div>
</template>

<script>
import input from './Input'
import select from './Select'
import dateTime from './DateTime'
export default {
  data () {
    return {
      ip: '',
      dataBaseName: '',
      tableName: '',
      startTime: '',
      sqlType: '',
      page: 1,
      sqlTypeOptions: [
        { value: 'do', label: 'do' },
        { value: 'undo', label: 'undo' }
      ],
      endTime: ''
    }
  },
  components: {
    'sql-export-input': input,
    'sql-export-select': select,
    'sql-export-dateTime': dateTime
  },
  methods: {
    event (v) {
      if (v.name === 'dateTime') {
        this.startTime = v.start
        this.endTime = v.end
      }
      if (v.name === 'ip') {
        this.ip = v.value
      }
      if (v.name === 'dataBaseName') {
        this.dataBaseName = v.value
      }
      if (v.name === 'tableName') {
        this.tableName = v.value
      }
      if (v.name === 'pageNum') {
        this.page = v.value
      }
      if (v.name === 'sqlType') {
        this.sqlType = v.value
      }
    },
    message (title, msg) {
      this.$alert(msg, title, {})
    },
    checkPost () {
      var self = this
      if (this.isBlank(self.ip)) {
        return '数据库地址不能为空'
      }
      if (this.isBlank(self.dataBaseName)) {
        return '数据库名不能为空'
      }
      if (this.isBlank(self.tableName)) {
        return '数据库表名不能为空'
      }
      if (this.isBlank(self.sqlType)) {
        return 'sql类型不能为空'
      }
      if (this.isBlank(self.page + '')) {
        return '输入第几个10万行数据'
      }
      if (this.isBlank(self.startTime + '')) {
        return '开始时间不能为空'
      }
      if (this.isBlank(self.endTime + '')) {
        return '结束时间不能为空'
      }
      if (self.endTime - self.startTime > 86400000) {
        return '时间区间不能大于24小时'
      }
      return false
    },
    exportSql () {
      var self = this
      var msg = self.checkPost()
      if (msg) {
        self.message('无效参数', msg)
        return false
      }
      var header = {
        responseType: 'blob',
        headers: {
          // 'Accept': 'application/json',
          // 'Accept': 'text/csv; charset=utf-8',
          'Content-Type': 'application/json'
        }
      }
      // self.loading = true
      var post = {
        ip: self.ip,
        dataBaseName: self.dataBaseName,
        tableName: self.tableName,
        sqlType: self.sqlType,
        page: self.page,
        start: self.startTime,
        end: self.endTime
      }
      console.log(post)
      var url = self.getUrl2('sqlExport', 'csv')
      const loading = self.$loading({
        lock: true,
        text: '下载中',
        spinner: 'el-icon-loading',
        background: 'rgba(0, 0, 0, 0.7)'
      })
      self.$axios.post(url, post, header).then(function (response) {
        const url = window.URL.createObjectURL(new Blob([response.data]))
        const link = document.createElement('a')
        link.href = url
        link.setAttribute('download', 'sql.csv')
        document.body.appendChild(link)
        link.click()
        loading.close()
      })
    }
  }
}
</script>

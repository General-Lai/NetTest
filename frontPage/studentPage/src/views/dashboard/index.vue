<template>
  <div style="margin-top: 10px">
    <el-row>
      <el-carousel :interval="5000" arrow="always" type="card">
        <el-carousel-item >
          <img src="@/assets/carousel/hb1.png" class="carousel-img">
        </el-carousel-item>
        <el-carousel-item >
          <img src="@/assets/carousel/hb2.png" class="carousel-img">
        </el-carousel-item>
        <el-carousel-item >
          <img src="@/assets/carousel/hb3.png" class="carousel-img">
        </el-carousel-item>
<!--        <el-carousel-item >-->
<!--          <img src="@/assets/carousel/4.png" class="carousel-img">-->
<!--        </el-carousel-item>-->
      </el-carousel>
    </el-row>
    <el-row class="app-item-contain">
      <h3 class="index-title-h3" style="border-color: #3651d4">任务中心</h3>
      <div style="padding-left: 15px">
        <el-alert
          title="暂无任务发布"
          type="info"
          show-icon
          effect="dark"
          v-if= "taskList.length===0"
          :closable="false"
        >
        </el-alert>
        <el-collapse  v-loading="taskLoading"  accordion v-if="taskList.length!==0">
          <el-collapse-item :title="taskItem.title" :name="taskItem.id" :key="taskItem.id" v-for="taskItem in taskList">
            <table class="index-task-table">
              <tr v-for="paperItem in taskItem.paperItems" :key="paperItem.examPaperId">
                <td class="index-task-table-paper">
                  {{paperItem.examPaperName}}
                </td>
                <td width="70px">
                  <el-tag :type="statusTagFormatter(paperItem.status)" v-if="paperItem.status !== null" size="mini">
                    {{ statusTextFormatter(paperItem.status) }}
                  </el-tag>
                </td>
                <td width="80px">
                  <router-link target="_blank" :to="{path:'/do',query:{id:paperItem.examPaperId}}" v-if="paperItem.status === null">
                    <el-button  type="text" size="small">开始答题</el-button>
                  </router-link>
                  <router-link target="_blank" :to="{path:'/edit',query:{id:paperItem.examPaperAnswerId}}" v-else-if="paperItem.status === 1">
                    <el-button  type="text" size="small">批改试卷</el-button>
                  </router-link>
                  <router-link target="_blank" :to="{path:'/read',query:{id:paperItem.examPaperAnswerId}}" v-else-if="paperItem.status === 2">
                    <el-button  type="text" size="small">查看试卷</el-button>
                  </router-link>
                </td>
              </tr>
            </table>
          </el-collapse-item>
        </el-collapse>
      </div>
    </el-row>
    <el-row class="app-item-contain">
      <h3 class="index-title-h3" style="border-color: #2ce8b4">固定试卷</h3>
      <div style="padding-left: 15px">
        <el-alert
          title="暂无固定试卷"
          type="info"
          show-icon
          effect="dark"
          v-if="fixedPaper.length===0"
          :closable="false"
        >
        </el-alert>
        <el-col :span="4" v-for="(item, index) in fixedPaper" :key="index" :offset="index > 0 ? 1 : 0">
          <el-card :body-style="{ padding: '0px' }" v-loading="loading">
            <img src="@/assets/exam-paper/show1.png" class="image">
            <div style="padding: 14px;">
              <span>{{item.name}}</span>
              <div class="bottom clearfix">
                <router-link target="_blank" :to="{path:'/do',query:{id:item.id}}">
                  <el-button type="text" class="button">开始做题</el-button>
                </router-link>
              </div>
            </div>
          </el-card>
        </el-col>
      </div>
    </el-row>
    <el-row class="app-item-contain">
      <h3 class="index-title-h3" style="border-color: #dcd041">时段试卷</h3>
      <div style="padding-left: 15px">
        <el-alert
          title="暂无时段试卷"
          type="info"
          show-icon
          effect="dark"
          v-if="timeLimitPaper.length===0"
          :closable="false"
        >
        </el-alert>
        <el-col :span="4" v-for="(item, index) in timeLimitPaper" :key="index" :offset="index > 0 ? 1 : 0">
          <el-card :body-style="{ padding: '0px' }" v-loading="loading">
            <img src="@/assets/exam-paper/show2.png" class="image">
            <div style="padding: 14px;">
              <span>{{item.name}}</span>
              <p class="index-limit-paper-time">
                <span>{{item.startTime}}</span>
                <br/>
                <span>{{item.endTime}}</span>
              </p>
              <div class="bottom clearfix">
                <router-link target="_blank" :to="{path:'/do',query:{id:item.id}}">
                  <el-button type="text" class="button">开始做题</el-button>
                </router-link>
              </div>
            </div>
          </el-card>
        </el-col>
      </div>
    </el-row>
  </div>
</template>

<script>
import { mapState, mapGetters } from 'vuex'
import indexApi from '@/api/dashboard'
export default {
  data () {
    return {
      fixedPaper: [],
      timeLimitPaper: [],
      pushPaper: [],
      loading: false,
      taskLoading: false,
      taskList: []
    }
  },
  created () {
    let _this = this
    this.loading = true

    indexApi.index().then(re => {
      _this.fixedPaper = re.response.fixedPaper
      _this.timeLimitPaper = re.response.timeLimitPaper
      _this.pushPaper = re.response.pushPaper
      _this.loading = false
    })

    this.taskLoading = true
    indexApi.task().then(re => {
      _this.taskList = re.response
      _this.taskLoading = false
    })
  },
  methods: {
    statusTagFormatter (status) {
      return this.enumFormat(this.statusTag, status)
    },
    statusTextFormatter (status) {
      return this.enumFormat(this.statusEnum, status)
    },
    fuck (event) {
      console.log(this.timeLimitPaper)
    }
  },
  computed: {
    ...mapGetters('enumItem', [
      'enumFormat'
    ]),
    ...mapState('enumItem', {
      statusEnum: state => state.exam.examPaperAnswer.statusEnum,
      statusTag: state => state.exam.examPaperAnswer.statusTag
    })
  }
}
</script>

<style lang="scss" scoped>
  img{
    width: 100%;
  }
  .index-title-h3 {
    padding-bottom: 5px;
    padding-left: 10px;
    font-size: 22px;
    font-weight: 400;
    color: #1f2f3d;
    border-left: solid 10px ;
    border-bottom: solid 10px ;
    display: inline-block;
  }

  .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .bottom {
    margin-top: 13px;
    line-height: 12px;
  }

  .button {
    padding: 0;
    float: right;
  }

  .image {
    width: 50%;
    height: 80%;
    display: block;
    margin: 20px auto 10px auto;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }
</style>

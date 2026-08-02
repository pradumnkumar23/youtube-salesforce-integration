import { LightningElement, track } from 'lwc';
import searchVideos from '@salesforce/apex/YouTubeIntegrationController.searchVideos';

export default class YoutubeSearch extends LightningElement {

    searchKey = '';
    @track videos = [];
    isLoading = false;

    selectedVideoId = '';
    selectedVideoTitle = '';
    selectedChannel = '';
    selectedDescription = '';
    showPlayer = false;

    suggestions = [
    'Salesforce LWC',
    'Apex Tutorial',
    'Flow Builder',
    'Agentforce',
    'Salesforce Integration',
    'Java',
    'Python',
    'React',
    'AI',
    'ChatGPT'
];



selectSuggestion(event){

    this.searchKey = event.currentTarget.dataset.value;

}

closePlayer(){

    this.showPlayer = false;

    this.selectedVideoId = '';

    this.selectedVideoTitle = '';

    this.selectedChannel = '';

    this.selectedDescription = '';

}
    handleChange(event) {
        this.searchKey = event.target.value;
    }

    searchVideos() {

        this.isLoading = true;

        searchVideos({
            keyword: this.searchKey
        })
        .then(result => {

            console.log('Result : ', result);

            this.videos = result;

            if (result.length > 0) {
                this.showPlayer = false;
                this.selectedVideoTitle = result[0].title;
                this.selectedChannel = result[0].channelTitle;
                this.selectedDescription = result[0].description;
            }

        })
        .catch(error => {
            console.error(error);
        })
        .finally(() => {
            this.isLoading = false;
        });
    }

    get videoUrl() {
        if (!this.selectedVideoId) {
            return '';
        }
        return `https://www.youtube.com/embed/${this.selectedVideoId}`;
    }

    playVideo(event) {
    const id = event.currentTarget.dataset.id;

    const selected = this.videos.find(v => v.videoId === id);

    if (selected) {
        this.selectedVideoId = selected.videoId;
        this.selectedVideoTitle = selected.title;
        this.selectedChannel = selected.channelTitle;
        this.selectedDescription = selected.description;

        this.showPlayer = true;
    }
}

}
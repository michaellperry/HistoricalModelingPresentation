using System.Collections.Generic;
using System.Linq;
using ThoughtCloud_Presentation.ViewModels;
using HistoricalModelingPresentation.ViewModels;

namespace ThoughtCloud.Presentation.Navigation
{
    public class NavigationGraph
    {
        private NavigationController _controller;
        private List<IPresentationViewModel> _viewModels = new List<IPresentationViewModel>();
        private int _index = 0;

        public NavigationGraph(NavigationController controller)
        {
            _controller = controller;

            _viewModels.Add(new TitleViewModel());
            _viewModels.Add(new BrainViewModel());
            _viewModels.Add(new CorrespondenceViewModel());
            _viewModels.Add(new TextViewModel(
                "Historical Modeling",
                "Captures system state in the relationships among partially ordered historical facts."));
            _viewModels.Add(new GiftCardViewModel());
            _viewModels.Add(new BulletPointViewModel("Lessons learned")
                .AddBullet("History is more important than state")
                .AddBullet("Sometimes order matters"));
            _viewModels.Add(new TextViewModel(
                "Historical Modeling",
                "Captures system state in the relationships among partially ordered historical facts."));
            _viewModels.Add(new FulfillmentViewModel());
            _viewModels.Add(new BulletPointViewModel("The rules of Historical Modeling")
                .AddBullet("Facts are immutable")
                .AddBullet("A fact knows its predecessors")
                .AddBullet("A fact is identified by its type, fields, and predecessors"));
        }

        public void Start()
        {
            _controller.NavigateTo(_viewModels.First());
        }

        public void Forward()
        {
            bool navigated = _viewModels[_index].Forward();
            if (!navigated && _index < _viewModels.Count - 1)
            {
                _index++;
                _controller.NavigateTo(_viewModels[_index]);
            }
        }

        public void Backward()
        {
            bool navigated = _viewModels[_index].Backward();
            if (!navigated && _index > 0)
            {
                _index--;
                _controller.NavigateTo(_viewModels[_index]);
            }
        }
    }
}

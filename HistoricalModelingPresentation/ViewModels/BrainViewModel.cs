using UpdateControls.Fields;

namespace ThoughtCloud_Presentation.ViewModels
{
    public class BrainViewModel : IPresentationViewModel
    {
        public enum StateId
        {
            Start,
            Correspondence,
            Physically,
            Device,
            Workstation,
            Service,
            Need,
            End
        }

        private Independent<StateId> _state = new Independent<StateId>();

        public StateId State
        {
            get { return _state; }
        }

        public bool Forward()
        {
            if (_state.Value != StateId.End - 1)
            {
                _state.Value = _state.Value + 1;
                return true;
            }
            else
                return false;
        }

        public bool Backward()
        {
            if (_state.Value != StateId.Start)
            {
                _state.Value = _state.Value - 1;
                return true;
            }
            else
                return false;
        }

        public string Title
        {
            get
            {
                switch (_state.Value)
                {
                    case StateId.Start:
                        return "Data";
                    case StateId.Correspondence:
                    case StateId.Physically:
                    case StateId.Device:
                    case StateId.Workstation:
                    case StateId.Service:
                    case StateId.Need:
                        return "Data Model";
                }
                return string.Empty;
            }
        }
    }
}

using ThoughtCloud_Presentation.ViewModels;
using UpdateControls.Fields;

namespace HistoricalModelingPresentation.ViewModels
{
    public class FulfillmentViewModel : IPresentationViewModel
    {
        public enum StateId
        {
            Start,
            PlaceOrder,
            PlaceCustomer,
            PlaceCompany,
            PlaceOrderB,
            PlaceCustomer2,
            BackToOne,
            ShowShipment,
            PlaceShipment,
            ShowInvoice,
            PlaceInvoice,
            ShowDelivery,
            PlaceDelivery,
            ShowPayment,
            PlacePayment,
            ShowFollowUp,
            PlaceFollowUp,
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
    }
}

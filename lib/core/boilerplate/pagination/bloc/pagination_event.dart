
abstract class PaginationEvent {}
class BasePaginationEvent extends PaginationEvent {
  bool loadMore;
  BasePaginationEvent({this.loadMore = false});
}